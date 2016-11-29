package customframework.com.cmm.view;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONSerializer;

import org.springframework.web.servlet.view.AbstractView;

/**
 * Spring JSON View
 * model attribute 에 담긴 값들을 JSON 문자열 형태로 변환후 response 한다. 
 * @author stove99
 *
 */
public class JsonView extends AbstractView {

	protected void renderMergedOutputModel(Map model, HttpServletRequest request, HttpServletResponse response) throws Exception {
		Object objCommand = model.get("command");
		new JSONSerializer();
		String json = JSONSerializer.toJSON(objCommand).toString();

		response.setContentType("text/plain; charset=utf-8");
		response.getWriter().println(json);
		response.getWriter().flush();
		response.getWriter().close();
	}
}

