require 'haruki_zaemon/stripper/active_record/base'

ActiveRecord::Base.send(:include, HarukiZaemon::Stripper::ActiveRecord::Base)
