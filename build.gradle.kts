plugins {
    java
    id("com.diffplug.spotless") version "6.25.0"
}

group = "org.example"
version = "0.0.1-SNAPSHOT"

java {
    sourceCompatibility = JavaVersion.VERSION_21
    targetCompatibility = JavaVersion.VERSION_21
}

repositories {
    mavenCentral()
}

spotless {
    java {
        importOrder()
        googleJavaFormat()
        removeUnusedImports()
        toggleOffOn()
    }

    sql {
        target(
            "src/**/*.sql"
        )
        toggleOffOn()

        dbeaver().configFile("dbeaver.properties")
    }
}