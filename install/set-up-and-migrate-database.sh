echo "${_group}Setting up / migrating database ..."

$dcr web python3 manage.py migrate

echo "${_endgroup}"
