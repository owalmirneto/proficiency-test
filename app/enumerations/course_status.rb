class CourseStatus < EnumerateIt::Base
  associate_values(
    wait: 1,
    open: 2,
    closed: 3
  )
end
