.PHONY: get clean run-patient run-provider test

get:
	dart pub get

clean:
	cd apps/patient_app && flutter clean
	cd apps/provider_app && flutter clean

run-patient:
	cd apps/patient_app && flutter run

run-provider:
	cd apps/provider_app && flutter run

test-all:
	cd packages/core && flutter test
	cd packages/ui_kit && flutter test
	cd apps/patient_app && flutter test
	cd apps/provider_app && flutter test

build-patient-android:
	cd apps/patient_app && flutter build apk --release

build-provider-android:
	cd apps/provider_app && flutter build apk --release