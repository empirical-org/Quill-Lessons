class Chapter::StoriesController < Chapter::BaseController

  def show
    @assessment = @chapter.assessment
    @body_class = 'con-skyblue'
  end

  def create

    # do some error handling if bad data presented
    if params[:_json].blank?
      render layout: false and return
    end


    @activity_session.start!
    @activity_session.check_submission(params[:_json])

    @activity_session.save


    # sugar, for ui
    @checker = @activity_session.story_checker

    #
    # @checker = StoryChecker.new(@score)
    # @checker.context = self
    # debugger
    # @checker.check_input!(params.delete(:_json))
    #
    # @score.state = 'started'
    # @score.payload
    #
    # debugger
    # @score.save

    render layout: false
  end
end
