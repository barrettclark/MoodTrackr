class RootController < UITableViewController
  CELLID = "face"

  def viewDidLoad
    super
    view.dataSource = view.delegate = self
    navigationItem.title = "Pick A Mood"
    # Mood.destroy_all
  end

  # def tableView(tableView, titleForHeaderInSection:section)
  # end

  # def sectionIndexTitlesForTableView(tableView)
  # end

  # def tableView(tableView, sectionForSectionIndexTitle:title, atIndex:index)
  # end

  def tableView(tableView, numberOfRowsInSection:section)
    Mood::FACES.keys.count
  end

  def tableView(tableView, cellForRowAtIndexPath: indexPath)
    cell = tableView.dequeueReusableCellWithIdentifier(CELLID) || begin
      cell = UITableViewCell.alloc.initWithStyle(UITableViewCellStyleDefault, reuseIdentifier:CELLID)
      cell.selectionStyle = UITableViewCellSelectionStyleBlue
      cell
    end

    cell.textLabel.text = Mood.face_emoji(indexPath.row) + " #{Mood.face_name(indexPath.row)}"
    cell
  end

  def tableView(tableView, didSelectRowAtIndexPath:indexPath)
    tableView.deselectRowAtIndexPath(indexPath, animated: true)

    @mood_list_controller ||= MoodListController.alloc.init
    mood = Mood.insert_mood_for_selected_index(indexPath.row)
    self.navigationController.pushViewController(@mood_list_controller, animated:true)
  end
end
