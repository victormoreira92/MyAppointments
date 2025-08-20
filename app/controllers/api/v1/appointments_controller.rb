module Api
  module V1
    class AppointmentsController < ApplicationController
      before_action :set_appointment, only: %i[ show destroy ]

        # GET /appointments
      def index
        @appointments = Appointment.where(user_id: current_user.id).all

        render json: @appointments
      end

        # GET /appointments/1
      def show
      render json: @appointment
      end

        # POST /appointments
      def create
        @appointment = Appointment.new(appointment_params)

        if @appointment.save
          render json: { messages: "Appointment was created succesfull",
                         appointment: @appointment.as_json },
                 status: :created
        else
          render json: {
            error: {
              messages: @appointment.errors.full_messages
            }
          }, status: :unprocessable_entity
        end
      end

      # DELETE /appointments/1
      def destroy
        @appointment.destroy!
      end

      private
      def set_appointment
          @appointment = Appointment.find(params[:id])
      end

      def appointment_params
        params.require(:appointment).permit(:user_id, :professional_id, :start_time)
      end
    end
  end
end
