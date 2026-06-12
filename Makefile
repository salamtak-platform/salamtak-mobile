.PHONY: get clean run-customer run-admin test

get:
	dart pub get

clean:
	cd apps/customer_app && flutter clean
	cd apps/admin_app && flutter clean

run-customer:
	cd apps/customer_app && flutter run

run-admin:
	cd apps/admin_app && flutter run

test-all:
	cd packages/core && flutter test
	cd packages/ui_kit && flutter test
	cd apps/customer_app && flutter test
	cd apps/admin_app && flutter test

build-customer-android:
	cd apps/customer_app && flutter build apk --release

build-admin-android:
	cd apps/admin_app && flutter build apk --release