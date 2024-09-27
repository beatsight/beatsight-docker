echo "${_group}Detecting Licenes file"

if [ ! -f "license.json" ]; then
  echo "FAIL: Cound not find license.json in current directory. Exiting."
  exit 1
fi

echo "${_endgroup}"
