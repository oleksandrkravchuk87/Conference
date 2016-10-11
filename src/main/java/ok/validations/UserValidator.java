package ok.validations;

import ok.entity.Speaker;
import ok.repository.SpeakerRepo;
import ok.service.SpeakerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Created by OKK on 21.09.2016.
 */
@Component
public class UserValidator implements Validator {
    @Autowired
    private SpeakerService speakerService;
    @Autowired
            private SpeakerRepo speakerRepo;
    Pattern pattern = Pattern.compile("(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\\[(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])");

    public  boolean supports (Class<?> aClass){return Speaker.class.equals(aClass);}

    public void validate (Object o, Errors errors){
        Speaker speaker = (Speaker) o;
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "firstName", "firstName.empty" );
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "secondName", "secondName.empty");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "email", "email.empty");

            Speaker speaker1 = speakerRepo.findByLogin(speaker.getEmail());
        // already exist
        if (speaker1 != null) {
           errors.rejectValue("email", "email.alreadyExist");
        }
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "password", "password.empty");

        boolean passwordSwitcher = true;
        if (speaker.getPassword().length()<8){
            errors.rejectValue("password", "password.too.short");
            passwordSwitcher=false;
        }
        if (passwordSwitcher){
            if (!speaker.getPassword().equals(speaker.getPasswordConfirm())){
                errors.rejectValue("password", "bad.password");
            }
        }
        Matcher matcher;

        if(!(matcher =pattern.matcher(speaker.getEmail())).matches()){
            errors.rejectValue("email", "bad.email");
        }

    }
}
