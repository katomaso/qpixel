#!/bin/bash
set -x

if [ ! -f "/code/config/db-created" ]; then
    echo "Creating database"
    rails db:create
    rails db:schema:load || true
    echo "Migrating database"
    rails db:migrate
    rails r db/scripts/create_tags_path_view.rb || true
    rails r docker/create_admin_and_community.rb || true
    echo "Seeding database"
    UPDATE_POSTS=true rails db:seed
    touch /code/config/db-created
else
    echo "Migrating database"
    rails db:migrate

    # I think we should not seed multiple times
    # If this isn't done again, there is a 500 error on the first page about posts
    # echo "Seeding database"
    # rails db:seed
fi

if [ ! -f "public/assets/*.css" ]; then
    bundle exec rails assets:precompile
fi


if [ -f '/code/tmp/pids/server.pid' ]; then
    rm -rf /code/tmp/pids/server.pid
fi

# we don't start the server immediately in dev mode
if [[ "$1" != 'dev' ]]; then
    # defaults to port 3000
    echo "Starting server 0.0.0.0:3000"
    rails server -b 0.0.0.0
fi
