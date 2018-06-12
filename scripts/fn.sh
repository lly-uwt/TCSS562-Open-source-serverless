# make sure to deploy the function, set up context file before run this script
# sudo fn deploy -app java --no-bump

lvl=$1

if [ -z $lvl ]; then echo "lvl is unset - default lvl = 1"; lvl=1; fi

request() {
    echo `sudo fn call java /fn-java-function`>>fn-out.csv
}

warmup() {
    sudo fn call java /fn-java-function
}

echo "duration" > fn-out.csv
echo "start" > fn-time.csv

echo "warm up"
for i in $(eval echo {1..$((100 * $lvl))}); do warmup & done
sleep 50
for i in $(eval echo {1..$((100 * $lvl))}); do warmup & done
sleep 50
for i in $(eval echo {1..$((100 * $lvl))}); do warmup & done
sleep 50

echo "done warm up"

echo "1 request"
echo "1 request" >> fn-time.csv
echo "1 request" >> fn-out.csv
{ time `for i in {1}; do request & done`; } 2>> fn-time.csv
sleep 30

echo "$((25 * $lvl)) request"
echo "$((25 * $lvl)) request" >> fn-time.csv
echo "$((25 * $lvl)) request" >> fn-out.csv
{ time `for i in $(eval echo {1..$((25 * $lvl))}); do request & done`; } 2>> fn-time.csv
sleep 30

echo "$((50 * $lvl)) request"
echo "$((50 * $lvl)) request" >> fn-time.csv
echo "$((50 * $lvl)) request" >> fn-out.csv
{ time `for i in $(eval echo {1..$((50 * $lvl))}); do request & done`; } 2>> fn-time.csv
sleep 40

echo "$((75 * $lvl)) request"
echo "$((75 * $lvl)) request" >> fn-time.csv
echo "$((75 * $lvl)) request" >> fn-out.csv
{ time `for i in $(eval echo {1..$((75 * $lvl))}); do request & done`; } 2>> fn-time.csv
sleep 50

echo "$((100 * $lvl)) request"
echo "$((100 * $lvl)) request" >> fn-time.csv
echo "$((100 * $lvl)) request" >> fn-out.csv
{ time `for i in $(eval echo {1..$((100 * $lvl))}); do request & done`; } 2>> fn-time.csv

echo "done"