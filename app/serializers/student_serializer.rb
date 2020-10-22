class StudentSerializer
  include FastJsonapi::ObjectSerializer
  attributes :firstName, :lastName, :email, :uin, :gradYear, :major, :status
end
