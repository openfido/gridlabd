#!/bin/sh
#
# GridLAB-D environment for OpenFIDO
#

error()
{
    echo '*** ABNORMAL TERMINATION ***'
    echo 'See error Console Output stderr for details.'
    echo "See https://pipeline.github.com/openfido/gridlabd for help"
    exit 1
}

trap on_error 1 2 3 4 6 7 8 11 13 14 15

set -x # print commands
set -e # exit on error
set -u # nounset enabled

if [ ! -f "/usr/local/bin/gridlabd" ]; then
    echo "ERROR [openfido.sh]: '/usr/local/bin/gridlabd' not found" > /dev/stderr
    error
elif [ ! -f "$OPENFIDO_INPUT/gridlabd.rc" ]; then
    echo "ERROR [openfido.sh]: '$OPENFIDO_INPUT/gridlabd.rc' not found" > /dev/stderr
    error
fi

echo '*** INPUTS ***'
ls -l $OPENFIDO_INPUT
FILES=$(cd $OPENFIDO_INPUT; ls)

cd $OPENFIDO_INPUT
gridlabd $(tr '\n' ' ' < gridlabd.rc) || error
cp -R . $OPENFIDO_OUTPUT
for FILE in $FILES; do
    diff -q $OPENFIDO_INPUT/$FILE $OPENFIDO_OUTPUT/$FILE >/dev/null && rm $OPENFIDO_OUTPUT/$FILE
done

echo '*** OUTPUTS ***'
ls -l $OPENFIDO_OUTPUT

echo '*** RUN COMPLETE ***'
echo 'See Data Visualization and Artifacts for results.'

echo '*** END ***'

