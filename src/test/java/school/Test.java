package school;

import static org.junit.Assert.*;

import java.util.List;

import javax.annotation.Resource;

import com.school.dao.ClassesMapper;
import com.school.pojo.Student;
import com.school.service.ClassesService;

public class Test {
	@Resource
	ClassesService classesService;
	@org.junit.Test
	public void test() {
		List<Student> sList = classesService.getStudents(2);
		for (int i = 0; i <sList.size(); i++) {
			System.out.println(sList.get(i));
		}
	}

}
