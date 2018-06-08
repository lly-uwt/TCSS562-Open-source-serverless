# make sure to deploy the function, set up context file before run this script
# sudo fn deploy -app java --no-bump

request() {
    echo `sudo fn call java /fn-java-function`>>fn-out.csv
}

warmup() {
    sudo fn call java /fn-java-function
}

echo "duration" > fn-out.csv
echo "start" > fn-time.csv

echo "warm up"
for i in {1..100}; do warmup & done
sleep 50
for i in {1..100}; do warmup & done
sleep 50
for i in {1..100}; do warmup & done
sleep 50
echo "done warm up"

echo "1"
echo "1 request" >> fn-time.csv
echo "1 request" >> fn-out.csv
{ time `for i in {1}; do request & done`; } 2>> fn-time.csv
sleep 30

echo "25"
echo "25 request" >> fn-time.csv
echo "25 request" >> fn-out.csv
{ time `for i in {1..25}; do request & done`; } 2>> fn-time.csv
sleep 30

echo "50"
echo "50 request" >> fn-time.csv
echo "50 request" >> fn-out.csv
{ time `for i in {1..50}; do request & done`; } 2>> fn-time.csv
sleep 40

echo "75"
echo "75 request" >> fn-time.csv
echo "75 request" >> fn-out.csv
{ time `for i in {1..75}; do request & done`; } 2>> fn-time.csv
sleep 50

echo "100"
echo "100 request" >> fn-time.csv
echo "100 request" >> fn-out.csv
{ time `for i in {1..100}; do request & done`; } 2>> fn-time.csv

echo "done"