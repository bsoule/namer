class User
  def initialize
    @votes = Hash.new 
  end

  def get_vote(name)
    @votes[name]
  end

  def vote_on(name,dir)
    @votes[name] = dir
  end
end
