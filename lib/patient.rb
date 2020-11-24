class Patient

    @@all = []

    attr_reader :name

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def new_appointment(date, doctor)
        # given a date and doctor, creates a new appointment belonging to that patient
        Appointment.new(date, self, doctor)
    end

    def appointments
        # returns all appointments associated with this Patient
        Appointment.all.select {|a| a.patient == self}
    end

    def doctors
        # has many doctors through appointments
        appointments.map(&:doctor)
    end

end
