require "cognition"
require "sinatra/base"

# Demo plugin.
class Hello < Cognition::Plugins::Base
  match /hello/, :hello, help: {
    "hello" => "Greets you by name!"
  }

  match /date/, :date, help: {
    "date" => "Tells you what date it is."
  }

  def hello(msg, match_data = nil)
    name = msg.metadata[:creator][:familiar]
    "Hello #{name}"
  end

  def date(msg, match_data = nil)
    name = msg.metadata[:name]
    Thread.new {
      sleep 5
      msg.reply("It's #{%x(date)}. Sorry for the delay...")
    }
    "Working on it..."
  end
end

# Simple Sinatra App
class CognitionDemo < Sinatra::Base
  before do
    set_metadata
  end

  bot = Cognition::Bot.new
  bot.register(Hello)

  get "/welcome" do
    "Congratulations!"
  end

  post "/echo" do
    STDERR.puts request.body.read
    request.body.read
  end

  get "/help" do
    bot.process("help")
  end

  post "/chat" do
    bot.process(params[:command], @metadata)
  end

  def set_metadata
    @metadata = params[:metadata] ||= {}
  end
end
