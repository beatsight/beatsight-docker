set -euo pipefail
test "${DEBUG:-}" && set -x

# Override any user-supplied umask that could cause problems, see #1222
umask 002

# Thanks to https://unix.stackexchange.com/a/145654/108960
log_file=beatsight_install_log-$(date +'%Y-%m-%d_%H-%M-%S').txt
exec &> >(tee -a "$log_file")


# Allow `.env` overrides using the `.env.custom` file.
# We pass this to docker compose in a couple places.
if [[ -f .env.custom ]]; then
  _ENV=.env.custom
else
  _ENV=.env
fi


# Read .env for default values with a tip o' the hat to https://stackoverflow.com/a/59831605/90297
# Summary of What the Command Does
#     Creates a temporary file.
#     Saves the current environment variables to that file.
#     Sets the shell to export all subsequently defined variables.
#     Sources a file (specified by $_ENV) that may define additional environment variables.
#     Stops the automatic exporting of new variables.
#     Sources the temporary file to restore the previously saved environment variables.
#     Cleans up by deleting the temporary file and unsetting the variable t.

# Purpose
# The overall purpose of this command sequence is to manage and preserve the environment variables within a shell session, allowing for the integration of additional variables from a specified file while ensuring that the original environment is restored afterward. This is useful in scenarios where you want to temporarily modify the environment without permanently affecting it.
t=$(mktemp) && export -p >"$t" && set -a && . $_ENV && set +a && . "$t" && rm "$t" && unset t


if [ "${GITHUB_ACTIONS:-}" = "true" ]; then
  _group="::group::"
  _endgroup="::endgroup::"
else
  _group="=== "
  _endgroup=""
fi


# Increase the default 10 second SIGTERM timeout
# to ensure celery queues are properly drained
# between upgrades as task signatures may change across
# versions
STOP_TIMEOUT=60 # seconds

