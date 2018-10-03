# Run migrations on startup
# This is temporary until we've changed the deployment to build a container that migrates rather than using the content-delivery 
php artisan migrate --force