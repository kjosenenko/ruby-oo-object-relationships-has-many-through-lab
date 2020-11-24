class Doctor

    @@all = []
    
    attr_reader :name

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def appointments
        # returns all appointments associated with this Doctor
        Appointment.all.select {|a| a.doctor == self}
    end

    def new_appointment(date, patient)
        # given a date and a patient, creates a new appointment
        Appointment.new(date, patient, self)
    end

    def patients
        # has many patients, through appointments
        appointments.map(&:patient)
    end
end
