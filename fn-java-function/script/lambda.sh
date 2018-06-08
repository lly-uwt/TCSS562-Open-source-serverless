
request() {
    output=`aws lambda invoke --function-name open-source /dev/stdout | head -n 1 | head -c -2 ; echo`
    echo "$output" | tr -d '"'>>out.csv
}

warmup() {
    aws lambda invoke --function-name open-source /dev/stdout
}

echo "duration" > out.csv
echo "start" > time.csv

echo "warm up"
for i in {1..100}; do warmup & done
sleep 50
for i in {1..100}; do warmup & done
sleep 50
for i in {1..100}; do warmup & done
sleep 50
echo "done warm up"

echo "1"
echo "1 request" >> time.csv
echo "1 request" >> out.csv
{ time `for i in {1}; do request & done`; } 2>> time.csv
sleep 30

echo "25"
echo "25 request" >> time.csv
echo "25 request" >> out.csv
{ time `for i in {1..25}; do request & done`; } 2>> time.csv
sleep 30

echo "50"
echo "50 request" >> time.csv
echo "50 request" >> out.csv
{ time `for i in {1..50}; do request & done`; } 2>> time.csv
sleep 40

echo "75"
echo "75 request" >> time.csv
echo "75 request" >> out.csv
{ time `for i in {1..75}; do request & done`; } 2>> time.csv
sleep 50

echo "100"
echo "100 request" >> time.csv
echo "100 request" >> out.csv
{ time `for i in {1..100}; do request & done`; } 2>> time.csv

echo "done"