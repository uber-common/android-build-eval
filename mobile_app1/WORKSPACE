android_sdk_repository(
    name = "androidsdk",
)

# Google Maven Repository
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
GMAVEN_TAG = "20181212-2"
http_archive(
    name = "gmaven_rules",
    strip_prefix = "gmaven_rules-%s" % GMAVEN_TAG,
    urls = ["https://github.com/bazelbuild/gmaven_rules/archive/%s.tar.gz" % GMAVEN_TAG],
)
load("@gmaven_rules//:gmaven.bzl", "gmaven_rules")
gmaven_rules()

http_archive(
    name = "rules_jvm_external",
    strip_prefix = "rules_jvm_external-2.8",
    urls = ["https://github.com/bazelbuild/rules_jvm_external/archive/2.8.zip"],
    sha256 = "79c9850690d7614ecdb72d68394f994fef7534b292c4867ce5e7dec0aa7bdfad",
)
load("@rules_jvm_external//:defs.bzl", "maven_install")
maven_install(
    artifacts = ["com.squareup.radiography:radiography:2.0.0",
"javax.inject:javax.inject:1",
"com.ryanharter.auto.value:auto-value-gson-runtime:1.2.0",
"io.opentracing:opentracing-api:0.20.10",
"com.squareup.retrofit2:adapter-rxjava:2.6.0",
"androidx.annotation:annotation-experimental:1.0.0",
"org.jetbrains.kotlinx:kotlinx-coroutines-android:1.3.9",
"androidx.exifinterface:exifinterface:1.0.0",
"com.gabrielittner.threetenbp:lazythreetenbp:0.8.0",
"com.facebook.device.yearclass:yearclass:2.1.0",
"androidx.activity:activity-ktx:1.2.0-beta02",
"com.f2prateek.rx.preferences2:rx-preferences:2.0.0",
"com.adyen.checkout:core:1.14.1",
"androidx.cardview:cardview:1.0.0",
"com.trello:rxlifecycle:1.0",
"com.facebook.shimmer:shimmer:0.4.0",
"com.github.akarnokd:rxjava2-extensions:0.20.10",
"io.grpc:grpc-api:1.23.0",
"com.jakewharton.rxbinding2:rxbinding-appcompat-v7:2.2.0",
"org.jetbrains.intellij.deps:trove4j:1.0.20181211",
"org.apache.commons:commons-collections4:4.1",
"io.card:android-sdk:5.5.1",
"org.reactivestreams:reactive-streams:1.0.2",
"com.andkulikov:transitionseverywhere:2.0.0-alpha01",
"com.facebook.network.connectionclass:connectionclass:1.0.1",
"com.squareup.wire:wire-compiler:3.0.0-rc01",
"com.squareup.duktape:duktape-android:1.3.0",
"com.jakewharton.timber:timber:4.7.0",
"androidx.preference:preference:1.1.1",
"androidx.browser:browser:1.0.0",
"commons-codec:commons-codec:1.10",
"com.camerakit:camerakit:1.0.0-beta3.10",
"com.jakewharton.rxrelay2:rxrelay:2.1.0",
"androidx.lifecycle:lifecycle-extensions:2.2.0",
"androidx.transition:transition:1.3.1",
"androidx.recyclerview:recyclerview:1.1.0",
"androidx.coordinatorlayout:coordinatorlayout:1.1.0",
"androidx.print:print:1.0.0",
"androidx.fragment:fragment:1.3.0-alpha08",
"com.firebase:firebase-jobdispatcher:0.8.5",
"javax.annotation:javax.annotation-api:1.3.2",
"org.tensorflow:tensorflow-lite:1.15.0",
"org.jetbrains.kotlin:kotlin-allopen:1.4.21",
"org.checkerframework:checker-compat-qual:2.5.5",
"androidx.camera:camera-camera2:1.0.0-rc01",
"com.android.installreferrer:installreferrer:1.0",
"io.github.inflationx:calligraphy3:3.1.1",
"com.jakewharton.rxrelay:rxrelay:1.2.0",
"com.facebook.stetho:stetho-okhttp:1.5.0",
"androidx.multidex:multidex:2.0.1",
"com.tdunning:t-digest:3.2",
"androidx.core:core-ktx:1.3.2",
"org.json:json:20141113",
"org.bitbucket.b_c:jose4j:0.6.5",
"com.squareup.okio:okio:2.7.0",
"com.squareup.picasso:picasso:2.71828",
"com.cocoahero.android:geojson:1.0.0",
"com.squareup.retrofit:converter-protobuf:1.9.0",
"androidx.legacy:legacy-support-core-ui:1.0.0",
"androidx.constraintlayout:constraintlayout:1.1.3",
"androidx.work:work-gcm:2.4.0",
"com.braintreepayments.api:braintree:2.18.0",
"androidx.appcompat:appcompat-resources:1.3.0-alpha02",
"io.reactivex.rxjava2:rxandroid:2.1.1",
"com.squareup.moshi:moshi-adapters:1.10.0",
"androidx.vectordrawable:vectordrawable-animated:1.1.0",
"com.jakewharton.scalpel:scalpel:1.1.2",
"com.facebook.fbjni:fbjni:0.0.4",
"androidx.biometric:biometric:1.1.0-beta01",
"androidx.security:security-crypto:1.1.0-alpha02",
"org.chromium.net:cronet-api:72.3626.96",
],
    repositories = ["https://jcenter.bintray.com/", "https://maven.google.com"],
)

# Kotlin Rules
http_archive(
    name = "io_bazel_rules_kotlin",
    strip_prefix = "rules_kotlin-legacy-1.3.0",
    urls = ["https://github.com/bazelbuild/rules_kotlin/archive/legacy-1.3.0.zip"],
    sha256 = "4fd769fb0db5d3c6240df8a9500515775101964eebdf85a3f9f0511130885fde",
)
load("@io_bazel_rules_kotlin//kotlin:kotlin.bzl", "kotlin_repositories", "kt_register_toolchains")
kotlin_repositories()
kt_register_toolchains()
