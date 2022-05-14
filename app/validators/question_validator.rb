class QuestionValidator < ActiveModel::Validator
    def validate(record)
        # may only have 1 right answer
        if record.answers.count {|a| a.correct} > 1
            record.errors[:question] << "Une question ne peut avoir qu'une seule bonne réponse !!"
        end

        # requires 1 correct answer
        if record.answers.none? {|a| a.correct}
            record.errors[:question] << "Vous avez pas proposez de réponse correcte d'abord !"
        end

        # must have 3 answers
        if record.answers.any? { |a| !a.content.present?}
            record.errors[:question] << "Une question doit avoir 3 propositions"
        end

        # answers must be unique
        if !!record.answers.collect {|a| a.content}.uniq!
            record.errors[:question] << "Cette reponse existe déja."
        end
        # question is unique for a given exrcice
        if record.exercice.questions.any? {|q| q.content == record.content }
            record.errors[:question] << "Cette question existe déja."
        end

        #je voudrais verifier la presence d'une explication
        #if record.exercice.questions.any? { |q| q.explain_answer.present?}
        #    record.errors[:question]  << "vous n'avez pas donner d'explication pour la question."
        #end
        

    end
end