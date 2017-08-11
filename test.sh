#! /bin/sh

cargo build
echo
for file in language/tests/*.cf
do
  echo "compiling $file"
  cargo run -q -- --no-output "$file" || \
    (echo "failure to compile : " $? && exit)
done
