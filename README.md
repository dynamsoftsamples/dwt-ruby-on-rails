# Dynamic Web TWAIN with Ruby on Rails
The sample demonstrates how to use Dynamic Web TWAIN with Ruby on Rails on Windows.

Installation
------------
* [Dynamic Web TWAIN 11.1][1]
* [Ruby 2.1.7][2]
* [Ruby Development Kit][3]

Basic Steps
-----------
1. Launch **cmd.exe** and **cd** to your working directory.
2. Create a new Dynamic Web TWAIN project with ``rails new dwt``.
3. Install all dependencies with ``bundle install``.
4. Create a controller with ``rails generate controller twainscanning home``.
5. Copy **Resources** folder from **< Dynamic Web TWAIN directory >\Resources**
   to **< Rails Project >\public\Resources**.
6. Open **< Rails Project >\app\views\twainscanning\home.html.erb** to add HTML code.
7. Open **< Rails Project >\app\controller\application_controler.rb** and comment out ``#protect_from_forgery with: :exception``.
8. Open **< Rails Project >\config\routes.rb** to add mapping

    ``` ruby
    get 'twainscanning/home'
    root 'twainscanning#home'
    post 'upload/' => 'twainscanning#upload'
    ```
9. Open **< Rails Project >\app\controller\twainscanning_controller.rb** to add following code for uploading images:

    ``` ruby
    class TwainscanningController < ApplicationController
      def home
      end

      def upload
        uploaded_io = params[:RemoteFile]

        upload_dir = Rails.root.join('public', 'upload')
        unless Dir.exist?(upload_dir)
          Dir.mkdir(upload_dir)
        end

        File.open(Rails.root.join('public', 'upload', uploaded_io.original_filename), 'wb') do |file|
          file.write(uploaded_io.read)
        end

        respond_to do |format|
          format.html.any { render text: "Successfully uploaded!"}
        end

      end
    end

    ```
10. Run ``rails server`` and visit ``localhost:3000``

Blog
----
[How to Load, Scan and Upload Files with Ruby on Rails][4]

[1]:http://www.dynamsoft.com/Downloads/WebTWAIN_Download.aspx
[2]:http://dl.bintray.com/oneclick/rubyinstaller/ruby-2.1.7-i386-mingw32.7z
[3]:http://dl.bintray.com/oneclick/rubyinstaller/DevKit-mingw64-32-4.7.2-20130224-1151-sfx.exe
[4]:http://www.codepool.biz/ruby-rails-scan-upload-file.html
