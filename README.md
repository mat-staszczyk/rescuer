# rescuer

Aplikacja, dzięki której użytkownicy mogą dodawać prośby o pomoc w określonej sytuacji oraz udzielać pomocy na podstawie istniejących już zapytań. Prośby będa posiadały możliwość określenia lokalizacji, której dotyczą. Po ukończeniu zadania jego autor potwierdza jego wykonanie jako OK/ŹLE. Na podstawie tej informacji ilość punktów na koncie pomagającego zostanie zmodyfikowana o odpowiednią wartość.

## instructions to run
1. `git clone https://github.com/sleaz0id/rescuer.git && cd rescuer`
2. With ruby installed in your system run `gem install bundler && bundle install`
3. `cp config/database.yml.example config/database.yml`
4. configure your database connection and if you plan to use something different than postgres, change the Gemfile to your needs
5. run `rails db:setup`
6. start the development server with `rails server -b localhost`
