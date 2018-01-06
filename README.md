# ResizePhoto

## Challenge

Given a Webservice endpoint that returns a JSON of
ten photos, consume it and generate three different photo formats for each one, that must
be small (320x240), medium (384x288) and large (640x480).

Finally, write a Webservice endpoint, which should use a non-relational
database(MongoDB preferred) and list (in JSON format) all ten photos with their
respective formats, providing their URLs

## How to run

I choose Ruby and Rails API for building this challange because the gems and facilities.

Clone the repository:

`
$ git clone https://github.com/henriquefernandez/ResizePhoto.git
`

Go to the repository folder:

`
$ cd ResizePhoto
`

With Ruby 2.3.4 installed, run bundle install:

`
$ bundle install
`

Perhaps you'll need to install imagemagick because papperclip. Run:

` 
$ sudo apt-get update
`

and:

`
$ sudo apt-get install imagemagick
`

to run the application:

`
$ rails s
`

Obs:. You can configure mongoDB to your default port on config/mongoid.yml