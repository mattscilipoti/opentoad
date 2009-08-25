def configuration
  Rails::Configuration.new.database_configuration[RAILS_ENV]
end

# Update: Looks for the SQLite and SQLite3 adapters for
# compatibility with Rails 1.2.2 and also older versions.
def in_memory_database?
  if (configuration['database'] == ':memory:' or
      configuration['dbfile'] == ':memory:')
    begin
      if ActiveRecord::Base.connection.class == ActiveRecord::ConnectionAdapters::SQLite3Adapter
        return true
      end
    rescue NameError => e
      if ActiveRecord::Base.connection.class == ActiveRecord::ConnectionAdapters::SQLiteAdapter
        return true
      end
    end
  end
  false
end

def verbosity
  configuration['verbosity']
end

def inform_using_in_memory
  puts "Creating sqlite :memory: database..."
end

def inform_creation_complete(duration)
  puts "Created sqlite 'in memory' database in %0.2fs." % duration
end

def prepare_database_with_inform
  time_start = Time.now
#  inform_using_in_memory
  yield
  inform_creation_complete(Time.now - time_start)
end

if in_memory_database?
  load_schema = lambda {
    load "#{RAILS_ROOT}/db/schema.rb" # use db agnostic schema by default
    #  ActiveRecord::Migrator.up('db/migrate') # use migrations
  }
  case verbosity
  when "silent"
    silence_stream(STDOUT, &load_schema)
  when "quiet"
    prepare_database_with_inform { silence_stream(STDOUT, &load_schema) }
  else
    prepare_database_with_inform { load_schema.call }
  end
end
