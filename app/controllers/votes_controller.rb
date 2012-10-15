class VotesController < ApplicationController
  def new 
    unless params[:Body].blank? && params[:From].blank?
      phone_number = params[:From].tr('^0-9','')
      incoming_message = params[:Body].strip.upcase
      @sms_response = nil
      
      if incoming_message == 'HELP'
        @sms_response = I18n.t :help, :thing => 'flavor', :help_website => 'http://youtube.com/watch?v=YQ4j-MBnLQo' 
      else
        @user = User.find_by_phone(phone_number)
        
        if @user.nil?
          @user = User.new
          @user.phone = phone_number.to_i
          @user.opt_in = true
          @user.save
        end
        
        if incoming_message == 'STOP'
          if @user.opt_out()
            @sms_response = I18n.t 'stop'
          else
            logger.error "Opt out failed for user id: #{ @user.id }"
          end
        else
          if Time.now > Time.parse(Settings.contest_start)
            @sms_response = I18n.t 'post_contest_message'
          elsif Time.now < Time.parse(Settings.contest_end)
            @sms_response = I18n.t 'pre_contest_message', :thing => 'flavor', :start_date => Time.parse(Settings.contest_start).strftime("%b %d")
          else
            if incoming_message =~ /^[0-9]{5}/
              @vote = Vote.new
              @vote.user_id
              @vote.voted_at = DateTime.now
              
              if @vote.save
                # render some xml and stuff
                @sms_response = I18n.t 'voted'
              else
                logger.error "Vote failed for user id: #{ @user.id }"
              end
            else
              # invalid
              @sms_response = I18n.t 'invalid_code', :thing => 'flavor'
            end
          end
        end
      end
      
      render :template => 'votes/new.xml.erb', :locals => {:sms_response => @sms_response} #:sms_response => @sms_response
    end
  end
end