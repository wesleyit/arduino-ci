include /usr/share/arduino/Arduino.mk

lintcheck:
	@echo "Running the lint check..."
	@splint -fileextensions -unrecog -exportlocal PrettyNiceCode.ino

stylecheck:
	@echo "Running the Google's Style check..."
	@python scripts/cpplint.py --extensions=ino ./PrettyNiceCode.ino

unittest: 
	@echo "Running the Unit test..."
	gcc PrettyNiceCodeTest.c -lcmocka -o PrettyNiceCodeTest
	rm -rf ./reports
	mkdir -p reports
	./PrettyNiceCodeTest

devicetest:
	@echo "Running tests on the Arduino device..."
