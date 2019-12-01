package innexgo;

import java.sql.ResultSet;
import java.sql.SQLException;
import org.springframework.jdbc.core.RowMapper;

public class CourseRowMapper implements RowMapper<Course> {

  @Override
  public Course mapRow(ResultSet row, int rowNum) throws SQLException {
    Course course = new Course();
    course.id = row.getLong("id");
    course.teacherId = row.getLong("teacher_id");
    course.locationId = row.getLong("location_id");
    course.period = row.getLong("period");
    course.subject = row.getString("subject");
    return course;
  }
}
