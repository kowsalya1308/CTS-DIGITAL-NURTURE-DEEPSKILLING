import trainers from "../TrainersMock";
import { Link } from "react-router-dom";

function TrainersList() {
    return (
        <div>
            <h3>Trainers List</h3>
            <ul>
                {trainers.map((trainer) => (
                    <li key={trainer.id}>
                        <Link to={`/trainer/${trainer.id}`}>
                            {trainer.name}
                        </Link>
                    </li>
                ))}
            </ul>
        </div>
    );
}

export default TrainersList;