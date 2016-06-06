lintcheck:
	@echo "Running the lint check..."
	@splint -fileextensions PrettyNiceCode.ino

stylecheck:
	@echo "Running the Google's Style check..."
	@python scripts/cpplint.py --extensions=ino ./PrettyNiceCode.ino

unittest:
	@echo "Running the Unit test..."
	gcc PrettyNiceCodeTest.c -lcmocka -o PrettyNiceCodeTest
	rm -rf ./reports
	mkdir -p reports
	export CMOCKA_MESSAGE_OUTPUT=XML
	export CMOCKA_XML_FILE=./reports/cmocka.xml
	./PrettyNiceCodeTest

devicetest:
	@echo "Running tests on the Arduino device..."

install:
	@echo "Building and installing the app..."

