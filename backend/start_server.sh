echo '------------------------------------------------'
echo 'START MIGRATIONS'
echo '------------------------------------------------'
python manage.py migrate
echo '------------------------------------------------'
echo 'END MIGRATION'
echo '------------------------------------------------'


echo '------------------------------------------------'
echo 'START COLLECT STATIC'
echo '------------------------------------------------'
python manage.py collectstatic
cp -r /app/collected_static/. /static/static/
echo '------------------------------------------------'
echo 'END COLLECT STATIC'
echo '------------------------------------------------'


echo '------------------------------------------------'
echo 'RUN SERVER'
echo '------------------------------------------------'
gunicorn --bind 0.0.0.0:9000 kittygram_backend.wsgi
