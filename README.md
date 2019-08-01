# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
## usersテーブル

|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|password|string|null: false, default: ""|
|email|string|null: false, unique: true|

### Association
- has_many :comments
- has_many :posts

## postsテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false|
|text|text||
|image|string||

### Association
- belongs_to :user
- has_many   :comments

## commentsテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false|
|post_id|integer|null: false|
|text|text||

### Association
- belongs_to :user
- belongs_to :post
