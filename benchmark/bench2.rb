# frozen_string_literal: true

require 'benchmark/ips'
require 'benchmark/memory'
require_relative '../lib/i18n/locale/tag'
require_relative '../lib/i18n/locale/tag/parents'
require_relative '../lib/i18n/locale/tag/simple'
require_relative '../lib/i18n/locale/fallbacks'

# args = [:en, [:baz, :buz], [:foo, :bar]]
# args = [:en, :true, :false]
# # args = [:en, 1, 2]
# I18n.normalize_keys :de, :de, :de
# I18n.normalize_keys2 :de, :de, :de
#
# [:memory, :ips].each do |type|
#   puts "#{type} benchmark:"
#   puts args.inspect
#
#   Benchmark.public_send(type) do |x|
#     x.report('patch') { I18n.normalize_keys2 *args }
#     x.report('original') { I18n.normalize_keys *args }
#     # x.report('patch') { I18n.normalize_keys2 :en, [1, 2], [1, 2] }
#     # x.report('original') { I18n.normalize_keys :en, [1, 2], [1, 2] }
#
#     x.compare!
#   end
#   puts I18n.normalize_keys(*args) == I18n.normalize_keys2(*args)
#
#   puts
# end

# args = { a: 1, b: 2, c: 3, d: 4, e: 5 }.freeze

# [:memory, :ips].each do |type|
#   puts "#{type} benchmark:"
#   puts args.inspect
#
#   Benchmark.public_send(type) do |x|
#     # x.report('original') { args.values.none? { |v| v.is_a?(Hash) } }
#     # x.report('patch') { args.each_value.none? { |v| v.is_a?(Hash) } }
#     x.report('original') { args.keys.none?(&:to_sym) }
#     x.report('patch') { args.each_key.none?(&:to_sym) }
#
#     x.compare!
#   end
#
#   puts
# end

# args = [:en, []].freeze
#
# [:memory, :ips].each do |type|
#   puts "#{type} benchmark:"
#   puts args.inspect
#
#   Benchmark.public_send(type) do |x|
#     x.report('original') { args.dup.flatten.compact }
#     x.report('patch') { args.dup.tap(&:flatten!).tap(&:compact!) }
#     x.report('patch2') do
#       args2 = args.dup
#       args2.flatten!
#       args2.compact!
#     end
#
#     x.compare!
#   end
#
#   puts
# end

# I18n::Locale::Fallbacks.new['de-de2-de3-de4']
# I18n::Locale::Fallbacks.new['de']

# I18n::Locale::Fallbacks.new[:de]
I18n::Locale::Fallbacks.new['de-de2-de3-de4']

[:memory, :ips].each do |type|
  puts "#{type} benchmark:"

  Benchmark.public_send(type) do |x|
    # x.report('original') { I18n::Locale::Fallbacks.new[:de] }
    x.report('original') { I18n::Locale::Fallbacks.new['de-de2-de3-de4'] }
    # x.report('patch') { args.dup.tap(&:flatten!).tap(&:compact!) }

    x.compare!
  end

  puts
end
