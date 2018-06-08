
request() {
    output=`aws lambda invoke --function-name open-source /dev/stdout | head -n 1 | head -c -2 ; echo`
    echo "$output" | tr -d '"'>>lambda-out.csv
}

warmup() {
    aws lambda invoke --function-name open-source /dev/stdout
}

echo "duration" > lambda-out.csv
echo "start" > lambda-time.csv

echo "warm up"
for i in {1..100}; do warmup & done
sleep 50
for i in {1..100}; do warmup & done
sleep 50
for i in {1..100}; do warmup & done
sleep 50
echo "done warm up"

echo "1"
echo "1 request" >> lambda-time.csv
echo "1 request" >> lambda-out.csv
{ time `for i in {1}; do request & done`; } 2>> lambda-time.csv
sleep 30

echo "25"
echo "25 request" >> lambda-time.csv
echo "25 request" >> lambda-out.csv
{ time `for i in {1..25}; do request & done`; } 2>> lambda-time.csv
sleep 30

echo "50"
echo "50 request" >> lambda-time.csv
echo "50 request" >> lambda-out.csv
{ time `for i in {1..50}; do request & done`; } 2>> lambda-time.csv
sleep 40

echo "75"
echo "75 request" >> lambda-time.csv
echo "75 request" >> lambda-out.csv
{ time `for i in {1..75}; do request & done`; } 2>> lambda-time.csv
sleep 50

echo "100"
echo "100 request" >> lambda-time.csv
echo "100 request" >> lambda-out.csv
{ time `for i in {1..100}; do request & done`; } 2>> lambda-time.csv

echo "done"