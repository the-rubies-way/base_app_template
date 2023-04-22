# ********** Setup Rubocop ********** #

empty_directory ".rubocop"

inside ".rubocop" do
  file "strict.yml", <<~YAML
  # Inherit from TODO here to make sure we enforce the rules below
  # (and TODO is ignored)
  inherit_from:
    - ../.rubocop_todo.yml

  Lint/Debugger: # don't leave binding.pry
    Enabled: true
    Exclude: []

  RSpec/Focus: # run ALL tests on CI
    Enabled: true
    Exclude: []

  Rails/Output: # Don't leave puts-debugging
    Enabled: true
    Exclude: []

  Rails/FindEach: # each could badly affect the performance, use find_each
    Enabled: true
    Exclude: []

  Rails/UniqBeforePluck: # uniq.pluck and not pluck.uniq
    Enabled: true
    Exclude: []
  YAML

  file "rspec.yml", <<~YAML
  require:
    - rubocop-rspec

  # Disable all cops by default,
  # only enable those defined explcitly in this configuration file
  RSpec:
    Enabled: false

  RSpec/Focus:
    Enabled: true

  RSpec/EmptyExampleGroup:
    Enabled: true

  RSpec/EmptyLineAfterExampleGroup:
    Enabled: true

  RSpec/EmptyLineAfterFinalLet:
    Enabled: true

  RSpec/EmptyLineAfterHook:
    Enabled: true

  RSpec/EmptyLineAfterSubject:
    Enabled: true

  RSpec/HookArgument:
    Enabled: true

  RSpec/HooksBeforeExamples:
    Enabled: true

  RSpec/ImplicitExpect:
    Enabled: true

  RSpec/IteratedExpectation:
    Enabled: true

  RSpec/LetBeforeExamples:
    Enabled: true

  RSpec/MissingExampleGroupArgument:
    Enabled: true

  RSpec/ReceiveCounts:
    Enabled: true

  RSpec/Capybara:
    Enabled: true

  RSpec/FactoryBot/AttributeDefinedStatically:
    Enabled: true

  RSpec/FactoryBot/CreateList:
    Enabled: true
  YAML

  file "rails.yml", <<~YAML
  require:
    - rubocop-rails

  Rails/ActionFilter:
    Enabled: true
    EnforcedStyle: action
    Include:
      - app/controllers/**/*.rb

  Rails/ActiveRecordAliases:
    Enabled: true

  Rails/ActiveSupportAliases:
    Enabled: true

  Rails/ApplicationJob:
    Enabled: true

  Rails/ApplicationRecord:
    Enabled: true

  Rails/AssertNot:
    Enabled: true
    Include:
      - '**/test/**/*'

  Rails/Blank:
    Enabled: true
    # Convert usages of `nil? || empty?` to `blank?`
    NilOrEmpty: true
    # Convert usages of `!present?` to `blank?`
    NotPresent: true
    # Convert usages of `unless present?` to `if blank?`
    UnlessPresent: true

  Rails/BulkChangeTable:
    Enabled: true
    Database: null
    Include:
      - db/migrate/*.rb

  Rails/CreateTableWithTimestamps:
    Enabled: true
    Include:
      - db/migrate/*.rb

  Rails/Date:
    Enabled: true
    EnforcedStyle: flexible

  Rails/Delegate:
    Enabled: true
    EnforceForPrefixed: true

  Rails/DelegateAllowBlank:
    Enabled: true

  Rails/DynamicFindBy:
    Enabled: true
    Whitelist:
      - find_by_sql

  Rails/EnumUniqueness:
    Enabled: true
    Include:
      - app/models/**/*.rb

  Rails/EnvironmentComparison:
    Enabled: true

  Rails/Exit:
    Enabled: true
    Include:
      - app/**/*.rb
      - config/**/*.rb
      - lib/**/*.rb
    Exclude:
      - lib/**/*.rake

  Rails/FilePath:
    Enabled: true
    EnforcedStyle: arguments

  Rails/FindBy:
    Enabled: true
    Include:
      - app/models/**/*.rb

  Rails/FindEach:
    Enabled: true
    Include:
      - app/models/**/*.rb

  Rails/HasAndBelongsToMany:
    Enabled: true
    Include:
      - app/models/**/*.rb

  Rails/HttpPositionalArguments:
    Enabled: true
    Include:
      - 'spec/**/*'
      - 'test/**/*'

  Rails/HttpStatus:
    Enabled: true
    EnforcedStyle: symbolic

  Rails/InverseOf:
    Enabled: true
    Include:
      - app/models/**/*.rb

  Rails/LexicallyScopedActionFilter:
    Enabled: true
    Safe: false
    Include:
      - app/controllers/**/*.rb

  Rails/NotNullColumn:
    Enabled: true
    Include:
      - db/migrate/*.rb

  Rails/Output:
    Enabled: true
    Include:
      - app/**/*.rb
      - config/**/*.rb
      - db/**/*.rb
      - lib/**/*.rb

  Rails/OutputSafety:
    Enabled: true

  Rails/PluralizationGrammar:
    Enabled: true

  Rails/Presence:
    Enabled: true

  Rails/Present:
    Enabled: true
    NotNilAndNotEmpty: true
    NotBlank: true
    UnlessBlank: true

  Rails/ReadWriteAttribute:
    Enabled: true
    Include:
      - app/models/**/*.rb

  Rails/RedundantReceiverInWithOptions:
    Enabled: true

  Rails/RefuteMethods:
    Enabled: true
    Include:
      - '**/test/**/*'

  Rails/RelativeDateConstant:
    Enabled: true
    AutoCorrect: false

  Rails/RequestReferer:
    Enabled: true
    EnforcedStyle: referer

  Rails/ReversibleMigration:
    Enabled: true
    Include:
      - db/migrate/*.rb

  Rails/SafeNavigation:
    Enabled: true
    ConvertTry: false

  Rails/ScopeArgs:
    Enabled: true
    Include:
      - app/models/**/*.rb

  Rails/TimeZone:
    Enabled: true
    EnforcedStyle: flexible

  Rails/UniqBeforePluck:
    Enabled: true
    EnforcedStyle: conservative
    AutoCorrect: false

  Rails/Validation:
    Enabled: true
    Include:
      - app/models/**/*.rb
  YAML
end

file(".rubocop.yml") do
  <<~YAML
inherit_from:
  - .rubocop/rails.yml
  - .rubocop/rspec.yml
  - .rubocop/strict.yml

inherit_mode:
  merge:
    - Exclude

require:
  - rubocop-performance
  - standard

inherit_gem:
  standard: config/base.yml

AllCops:
  SuggestExtensions: true
  NewCops: enable
  TargetRubyVersion: #{RUBY_VERSION}

Layout/SpaceInsideHashLiteralBraces:
  Enabled: true
  EnforcedStyle: compact

Layout/DotPosition:
  Enabled: true
  EnforcedStyle: leading

Layout/MultilineMethodCallIndentation:
  Enabled: true
  EnforcedStyle: aligned

Layout/ArgumentAlignment:
  Enabled: true
  EnforcedStyle: with_first_argument

Style/SymbolArray:
  Enabled: true
  EnforcedStyle: brackets

Style/WordArray:
  Enabled: true
  EnforcedStyle: brackets

Style/BlockDelimiters:
  Enabled: true
  EnforcedStyle: line_count_based

Layout/ExtraSpacing:
  Enabled: true
  ForceEqualSignAlignment: true
  Exclude:
    - "**/config/environments/**/*"
    - "**/config/application.rb"
    - "**/config/environment.rb"
    - "**/config/puma.rb"
    - "**/config/boot.rb"
    - "**/spec/*_helper.rb"
    - "**/spec/**/support/**/*"
    - "lib/generators/**/*"

Style/ClassAndModuleChildren:
  Enabled: true
  EnforcedStyle: compact
  Exclude:
    - "**/config/application.rb"
  YAML
end
