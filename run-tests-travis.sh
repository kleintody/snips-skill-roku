#!/bin/sh
set -e

VENV=venv

if [ ! -d "$VENV" ]
then

	PYTHON=$(which python3)

	if [ ! -f "$PYTHON" ]
	then
		echo "could not find python"
	fi
	virtualenv -p "$PYTHON" $VENV

fi

. $VENV/bin/activate

pip3 install -r requirements-dev.txt
py.test -sv tests/test_intents.py::test_intent_go_home
