#!/bin/bash
set -x

# If not created yet
if [ ! -f "/code/tmp/db-created" ]; then
    rails db:create
    rails db:schema:load
    rails db:migrate
    rails r db/scripts/create_tags_path_view.rb
    rails r docker/create_admin_and_community.rb
    echo "Seeding database"
    UPDATE_POSTS=true rails db:seed
    touch /code/tmp/db-created
fi

# If this isn't done again, there is a 500 error on the first page about posts
echo "Seeding database"
rails db:seed

# defaults to port 3000
echo "Starting server 0.0.0.0:3000"
rails server -b 0.0.0.0
