package ok.validations;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

/**
 * Created by OKK on 26.09.2016.
 */
@Component
public class ReportValidator implements Validator {


    public  boolean supports (Class<?> aClass){return String.class.equals(aClass);}

    @Override
    public void validate (Object o, Errors errors) {
        String string  = (String) o;
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "title", "title.empty");
//       ValidationUtils.rejectIfEmptyOrWhitespace(errors, "discription", "discription.empty");
//        if (report.getPresentation().length == 0){
//            errors.rejectValue("presentation", "presentation.empty");
//        }
    }
}

//    @Override
//    public boolean supports(Class clazz) {
//        //just validate the FileUpload instances
//        return FileUpload.class.isAssignableFrom(clazz);
//    }
//
//    @Override
//    public void validate(Object target, Errors errors) {
//
//        FileUpload file = (FileUpload)target;
//
//        if(file.getFile().getSize()==0){
//            errors.rejectValue("file", "required.fileUpload");
//        }
//    }

