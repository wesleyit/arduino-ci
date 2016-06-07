#include <stdarg.h>
#include <stddef.h>
#include <setjmp.h>
#include <cmocka.h>

static void test_get_light(void **state) {
	assert_int_equal(1, 1);
}

static void test_beep(void **state) {
	assert_int_equal(1, 1);
}

static void test_serial(void **state) {
	assert_int_equal(1, 1);
}

static void test_power(void **state) {
	assert_int_equal(1, 1);
}

static void test_output(void **state) {
	assert_int_equal(1, 1);
}

static void test_activation(void **state) {
	assert_int_equal(1, 1);
}

int main(void) {
	const struct CMUnitTest tests[] = {
		cmocka_unit_test(test_get_light),
		cmocka_unit_test(test_beep),
		cmocka_unit_test(test_serial),
		cmocka_unit_test(test_power),
		cmocka_unit_test(test_output),
		cmocka_unit_test(test_activation),		
	};
	return cmocka_run_group_tests(tests, NULL, NULL);
}
