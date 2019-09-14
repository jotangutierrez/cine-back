# Project

> PlaceIt Backend

## Install

### Clone the repository

```shell
git clone https://github.com/jotangutierrez/cine-back.git
cd cine-back
```

### Check your Ruby version

```shell
ruby -v
```

The ouput should start with something like `ruby 2.5.5`

If not, install the right ruby version using [rvm](https://rvm.io/rvm/install) (it could take a while):

```shell
rvm install 2.5.5
```

### Install dependencies

Using [Bundler](https://github.com/bundler/bundler)
```shell
bundle install
```

### Initialize the database

```shell
rails db:create db:migrate db:seed
```

### Go!

```shell
rails s
```