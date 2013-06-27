# Reduce the threshold for matches using trigrams
ActiveRecord::Base.connection.execute('select set_limit(0.1)')
