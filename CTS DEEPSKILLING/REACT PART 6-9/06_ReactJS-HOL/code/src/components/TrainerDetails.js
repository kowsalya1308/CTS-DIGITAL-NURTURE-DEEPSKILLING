import { useParams } from "react-router-dom";
import trainers from "../TrainersMock";

function TrainerDetails() {
    const { id } = useParams();
    const trainer = trainers.find((t) => t.id === parseInt(id));

    if (!trainer) {
        return <h2>Trainer Not Found</h2>;
    }

    const skillsList = Array.isArray(trainer.skills)
        ? trainer.skills
        : trainer.skills ? trainer.skills.split(",").map((s) => s.trim()) : [];

    return (
        <div>
            <h3>Trainers Details</h3>
            <p><b>{trainer.name} ({trainer.technology})</b></p>
            <p>{trainer.email}</p>
            <p>{trainer.phone}</p>
            <ul>
                {skillsList.map((skill, index) => (
                    <li key={index}>{skill}</li>
                ))}
            </ul>
        </div>
    );
}

export default TrainerDetails;