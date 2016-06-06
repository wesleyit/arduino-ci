#include <stdarg.h>
#include <stddef.h>
#include <setjmp.h>
#include <cmocka.h>

static void test_one(void **state) {
	assert_int_equal(10, 10);
}

static void test_two(void **state) {
	assert_int_equal(1, 1);
}

int main(void) {
	const struct CMUnitTest tests[] = {
		cmocka_unit_test(test_one),
		cmocka_unit_test(test_two),
	};
	return cmocka_run_group_tests(tests, NULL, NULL);
}
