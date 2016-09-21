class StudentsController < ApplicationController
  def new
    @student = Student.new

  end

  def create
    @student = Student.new(student_params)
    if @student.save
      redirect_to @student
    else
      render 'new'
    end
  end

  def edit
    @student = Student.find(params[:id])
  end

  def show
    @student = Student.find(params[:id])
  end

  def index
    # binding.pry
    @students = Student.all
    # binding.pry
    if params[:search]
      @students = Student.search(params[:search])
    end

  end

  def search
    @students = Student.all
    # binding.pry
    if params[:search]
      @student = Student.search(params[:search])
    end
    redirect_to index
  end

  def student_params
    params.require(:student).permit(:name, :birthday, :hometown)
  end
end
