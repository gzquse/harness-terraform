terraform {
  required_providers {
    harness = {
      source = "harness/harness"
      version = "0.2.0"
    }
  }
}

provider "harness" {
  endpoint   = "https://app.harness.io/gateway"
  account_id = "2zPKqzWjT3SUyklYJvslKg"
  api_key    = "MnpQS3F6V2pUM1NVeWtsWUp2c2xLZzo6VHZBUTRVZHl1SW9jSUpFYmNIb3ZKWG0zQW9mMDc5TncyVENwbHpZVU1hR003QVduSkF0MUZiaFFMSFdKRnJ4U3doWUdXem5nU0N1R2MyN2Q="
}