FactoryGirl.define do

  def session_credentials(session=nil)
    session ||= FactoryGirl.create(:session)
  end

end


