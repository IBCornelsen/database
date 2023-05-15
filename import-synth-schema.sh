COLLECTION=data;

rm ./$COLLECTION -r;
synth import $COLLECTION --from postgres://main:hHMP8cd%5EN3SnzGRR@localhost:5436/postgres;