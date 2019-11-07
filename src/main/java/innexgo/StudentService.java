package innexgo;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Transactional
@Repository
public class StudentService {

  @Autowired private PeriodService periodService;
  @Autowired private CourseService courseService;
  @Autowired private JdbcTemplate jdbcTemplate;

  public Student getById(long id) {
    String sql = "SELECT id, graduating_year, name, tags FROM student WHERE id=?";
    RowMapper<Student> rowMapper = new StudentRowMapper();
    Student student = jdbcTemplate.queryForObject(sql, rowMapper, id);
    return student;
  }

  public List<Student> getAll() {
    String sql = "SELECT id, graduating_year, name, tags FROM student";
    RowMapper<Student> rowMapper = new StudentRowMapper();
    return this.jdbcTemplate.query(sql, rowMapper);
  }

  public void add(Student student) {
    // Add student
    String sql = "INSERT INTO student(id, graduating_year, name, tags) values (?, ?, ?, ?)";
    jdbcTemplate.update(sql, student.id, student.graduatingYear, student.name, student.tags);
  }

  public void update(Student student) {
    String sql = "UPDATE student SET id=?, graduating_year=?, name=?, tags=? WHERE id=?";
    jdbcTemplate.update(
        sql, student.id, student.graduatingYear, student.name, student.tags, student.id);
  }

  public Student deleteById(long id) {
    Student student = getById(id);
    String sql = "DELETE FROM student WHERE id=?";
    jdbcTemplate.update(sql, id);
    return student;
  }

  public boolean existsById(long id) {
    String sql = "SELECT count(*) FROM student WHERE id=?";
    int count = jdbcTemplate.queryForObject(sql, Integer.class, id);
    return count != 0;
  }

  public List<Student> query(
      Long id, Long cardId, Long courseId, Integer graduatingYear, String name, String partialName, String tags) {
    String sql =
        "SELECT st.id, st.graduating_year, st.name, st.tags FROM student st"
            + (courseId == null ? "" : " INNER JOIN schedule sc ON st.id = sc.student_id ")
            + (cardId == null ? "" : " INNER JOIN card c ON c.student_id = st.id ")
            + " WHERE 1=1 "
            + (id == null ? "" : " AND st.id = " + id)
            + (cardId == null ? "" : " AND c.id = " + cardId)
            + (graduatingYear == null ? "" : " AND st.graduating_year = " + graduatingYear)
            + (name == null ? "" : " AND st.name = " + Utils.escape(name))
            + (partialName == null ? "" : " AND st.name LIKE " + Utils.escape("%"+partialName+"%"))
            + (tags == null ? "" : " AND st.tags = " + Utils.escape(tags))
            + (courseId == null ? "" : " AND sc.course_id = " + courseId)
            + ";";

    RowMapper<Student> rowMapper = new StudentRowMapper();
    return this.jdbcTemplate.query(sql, rowMapper);
  }

  // find students who are present at the location that they are supposed to be in at this period
  public List<Student> present(long courseId, long periodId) {
    Course course = courseService.getById(courseId);
    Period period = periodService.getById(periodId);

    // Find the sessions that have a start date before the period start date.
    // If they have an end date it must be after the period start date
    // find students who are not in this list

    String sql =
              " SELECT DISTINCT st.id, st.graduating_year, st.name, st.tags"
            + " FROM student st"
            + " RIGHT JOIN session ses ON ses.student_id = st.id"
            + " INNER JOIN encounter inen ON ses.in_encounter_id = inen.id"
            + " LEFT JOIN encounter outen ON ses.out_encounter_id = outen.id"
            + " WHERE 1 = 1 "
            + (" AND inen.location_id = " + course.locationId)
            + (" AND inen.time < " + period.startTime)
            + (" AND outen.time IS NULL OR outen.time > " + period.startTime)
            + " ;";

    RowMapper<Student> rowMapper = new StudentRowMapper();
    return this.jdbcTemplate.query(sql, rowMapper);
  }
}
