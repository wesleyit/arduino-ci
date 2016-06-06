lintcheck:
	@echo "Running the lint check..."
	@splint -fileextensions PrettyNiceCode.ino

stylecheck:
	@echo "Running the Google's Style check..."
	@python scripts/cpplint.py --extensions=ino ./PrettyNiceCode.ino

unittest:
	@echo "Running the Unit test..."
	rm ./reports/cmocka.xml

devicetest:
	@echo "Running tests on the Arduino device..."

install:
	@echo "Building and installing the app..."

